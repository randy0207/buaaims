let vue = new Vue({
    el: '#app',
    data() {
        return {
            map: null,
            dialogFormVisible: false,
            message: "Hello Element-UI",
            signList: [],
            signForm: {
                lon: '',
                lat: '',
                sign_id: '',
                sign_name: '',
                teacher_id: '',
                kc_id: '',
                sign_distance: '',
                dept_id: "",
                must_sign_num: '',
                sign_time: '',
                sign_last_time: '',
                address_detail: "",
                grade_id: "",
            },
            markersArray: [],
            local: null,
            teacherList: [],
            deptList: [],
            kcList: [],
            publishSignList: [],
            gradeList: [],
            showId: null,
            isAdd: false,
            pageParams: {
                // 页码  每页几条
                page: 1,
                pageSize: 10
            },
            curPage: 0, // 当前页数
            total: 0, // 一共几条数据
            signFormRule: {
                sign_name: [
                    {required: true, message: '请输入签到名称', trigger: 'blur'}
                ],
                teacher_id: [
                    {required: true, message: '请选择老师', trigger: 'blur'}
                ],
                kc_id: [
                    {required: true, message: '请选择课程', trigger: 'blur'}
                ],
                sign_distance: [
                    {required: true, message: '请输入签到距离', trigger: 'blur'}
                ],
                dept_id: [
                    {required: true, message: '请选择部门', trigger: 'blur'}
                ],
                must_sign_num: [
                    {required: true, message: '请输入必签人数', trigger: 'blur'}
                ],
                sign_time: [
                    {required: true, message: '请输入签到时间', trigger: 'blur'}
                ],
                sign_last_time: [
                    {required: true, message: '请输入签退时间', trigger: 'blur'}
                ],
                address_detail: [
                    {required: true, message: '请输入定位地址', trigger: 'blur'}
                ],
                grade_id: [
                    {required: true, message: '请选择年级', trigger: 'blur'}
                ]
            }

        };
    },
    mounted
        () {
        this.getPublishSignList();
        this.getDeptList();
        this.getTeacherList();
        this.getKcList();
        this.getGradeList();
    }
    ,
    watch: {
        //新增
        showId: function () {
            this.$nextTick(function () {
                this.resetForm();
                this.drawMap();
            });
        }
        ,
        //修改
        signForm: function () {
            this.$nextTick(function () {
                console.log("watch---signForm", this.signForm);
                this.drawMap();
            });
        }
    }
    ,
    methods: {
        hSizeChange(val) {
            this.pageParams.pageSize = val;
            this.getPublishSignList();
        }
        ,
        hCurrentChange(val) {
            this.pageParams.page = val;
            this.getPublishSignList();
        }
        ,
        cancel() {
            this.dialogFormVisible = false
            this.resetForm();
        }
        ,
        resetForm() {
            this.signForm = {
                lon: '',
                lat: '',
                sign_id: '',
                sign_name: '',
                teacher_id: '',
                kc_id: '',
                sign_distance: '',
                dept_id: "",
                must_sign_num: '',
                sign_time: '',
                sign_last_time: '',
                address_detail: "",
                grade_id: ''
            };
        }
        ,
        //时间格式化
        parseDateFull(time) {
            let x = new Date(time);
            let z = {
                y: x.getFullYear(),
                M: x.getMonth() + 1,
                d: x.getDate(),
                h: x.getHours(),
                m: x.getMinutes(),
                s: x.getSeconds(),
            };
            if (z.M < 10) {
                z.M = "0" + z.M;
            }
            if (z.d < 10) {
                z.d = "0" + z.d;
            }
            if (z.h < 10) {
                z.h = "0" + z.h;
            }
            if (z.m < 10) {
                z.m = "0" + z.m;
            }
            return z.y + "-" + z.M + "-" + z.d + " " + z.h + ":" + z.m;
        }
        ,
        showModal() {
            this.resetForm();
            this.showId = "渲染";
            this.isAdd = true;
            this.dialogFormVisible = true;
        }
        ,
        handleClose() {
            this.dialogFormVisible = false;
        }
        ,
        updateRow(id, row) {
            this.isAdd = false;
            console.log("row", row);
            this.getPublishSignById(row);
        }
        ,
        delRow(id, row) {
            console.log("row", row);
            this.delsPublishSign(row);
        }
        ,
        drawMap() {
            if (this.map == null) {
                this.map = new BMapGL.Map('map'); // 创建Map实例
            }
            this.map.centerAndZoom(new BMapGL.Point(116.404, 39.915), 12); // 初始化地图,设置中心点坐标和地图级别
            this.map.enableScrollWheelZoom(true); // 开启鼠标滚轮缩放
            this.map.addControl(new BMapGL.NavigationControl());
            this.getlocation();
            this.map.addEventListener("click", this.getClick);
        }
        ,
        getClick(e) {
            this.changeLocalLatlang(e.latlng.lng, e.latlng.lat);
            let point = new BMapGL.Point(this.signForm.lon, this.signForm.lat); // 创建点坐标
            this.getAddress(point);
            this.getMarker(point);
        }
        ,
        getMarker(point) {
            this.mk = new BMapGL.Marker(point);
            this.markersArray.push(this.mk);
            //清除标记
            for (let i = 0; i < this.markersArray.length; i++) {
                this.map.removeOverlay(this.markersArray[i])
            }
            this.mk.addEventListener("dragend", this.showInfo);
            this.mk.enableDragging();  //可拖拽
            this.getAddress(point);
            this.map.addOverlay(this.mk);//把点添加到地图上
            this.map.panTo(point);
        }
        ,
        getlocation() {
            //获取当前位置
            let that = this;
            let geolocation = new BMapGL.Geolocation();
            geolocation.getCurrentPosition((r) => {
                if (geolocation.getStatus() == BMAP_STATUS_SUCCESS) {
                    let point;
                    if (that.isAdd) {
                        that.signForm.lat = r.latitude;
                        that.signForm.lon = r.longitude;
                        point = new BMapGL.Point(r.longitude, r.latitude); // 创建点坐标
                    } else {
                        console.log("编辑", that.signForm.lat, that.signForm.lon);
                        point = new BMapGL.Point(that.signForm.lon, that.signForm.lat); // 创建点坐标
                    }
                    that.getMarker(point);
                } else {
                    alert('failed' + this.getStatus());
                }
            });
        }
        ,
        //绑定Marker的拖拽事件
        showInfo(e) {
            let pt = new BMapGL.Point(e.latLng.lng, e.latLng.lat);
            this.changeLocalLatlang(e.latLng.lng, e.latLng.lat)
            var gc = new BMapGL.Geocoder();
            gc.getLocation(pt, (rs) => {
                var addComp = rs.addressComponents;
                var address = addComp.province + addComp.city + addComp.district + addComp.street + addComp.streetNumber;//获取地址
                //画图 ---》显示地址信息
                var label = new BMapGL.Label(address, {offset: new BMapGL.Size(20, -10)});
                this.map.removeOverlay(this.mk.getLabel());//删除之前的label
                this.mk.setLabel(label);
                this.signForm.address_detail = address;
            });
        }
        ,
        //改变经纬度
        changeLocalLatlang(lon, lat) {
            this.signForm.lon = lon;
            this.signForm.lat = lat;
        }
        ,
        //获取地址信息，设置地址label
        getAddress(point) {
            let gc = new BMapGL.Geocoder();
            let that = this;
            gc.getLocation(point, (rs) => {
                console.log("rs", rs);
                let addComp = rs.addressComponents;
                let address = addComp.province + addComp.city + addComp.district + addComp.street + addComp.streetNumber;//获取地址
                //画图 ---》显示地址信息
                that.changeLocalLatlang(point.lng, point.lat);
                let label = new BMapGL.Label(address, {offset: new BMapGL.Size(20, -10)});
                that.map.removeOverlay(this.mk.getLabel());//删除之前的label
                that.signForm.address_detail = address;
                that.mk.setLabel(label);
            });

        }
        ,
        //搜索地址
        searchPlace() {
            this.map.clearOverlays(); //清除地图上所有覆盖物
            var local = new BMapGL.LocalSearch(this.map, {
                renderOptions: {map: this.map}
            });
            local.search(this.signForm.address_detail);
        }
        ,
        getPublishSignList() {
            let that = this;
            axios({
                method: 'post',
                url: '/publishSign/getPublishSignList',
                data: this.pageParams
            }).then(res => {
                console.log("publishSign", res);
                if (res.data.code == 100000) {
                    that.total = res.data.body.total;
                    that.publishSignList = res.data.body.list;
                    that.dialogFormVisible = false;
                } else {
                    that.$message(res.data.msg);
                }
            }).catch(error => {
                that.$message.error(error);
            });

        }
        ,
        getTeacherList() {
            let that = this;
            axios.get('/publishSign/teacherList', {params: {page: 1, pageSize: 10}}).then(res => {
                console.log("teacherList", res);
                that.teacherList = res.data.body;
            });
        }
        ,
        getDeptList() {
            let that = this;
            axios.get('/publishSign/deptList', {params: {page: 1, pageSize: 10}}).then(res => {
                console.log("deptList", res);
                that.deptList = res.data.body;
            });
        }
        ,
        getKcList() {
            let that = this;
            axios.get('/publishSign/getKcList', {params: {page: 1, pageSize: 10}}).then(res => {
                console.log("getKcList", res);
                that.kcList = res.data.body;
            });
        },
        getGradeList() {
            let that = this;
            axios.get('/publishSign/getGradeList', {params: {page: 1, pageSize: 10}}).then(res => {
                console.log("gradeList", res);
                that.gradeList = res.data.body;
            });
        }
        ,
        publishSign() {
            let that = this;
            console.log("publishSign", this.signForm);
            axios({
                method: 'post',
                url: '/publishSign/publish',
                data: this.signForm
            }).then(res => {
                console.log("publishSign", res);
                if (res.data.code == 100000) {
                    that.getPublishSignList();
                    that.dialogFormVisible = false;
                } else {
                    that.$message(res.data.msg);
                }
            }).catch(error => {
                that.$message.error(error);
            });
        }
        ,
        getPublishSignById(row) {
            let that = this;
            console.log("getPublishSignById", row.id);
            axios({
                method: 'get',
                url: '/publishSign/getPublishSignById/' + row.id + ""
            }).then(res => {
                console.log("getPublishSignById", res);
                if (res.data.code == 100000) {
                    that.signForm = res.data.body;
                    that.dialogFormVisible = true;
                } else {
                    that.$message(res.data.msg);
                }
            }).catch(error => {
                that.$message.error(error);
            });
        }
        ,
        updatePublishSign() {
            let that = this;
            axios({
                method: 'post',
                url: '/publishSign/updatePublishSign',
                data: this.signForm
            }).then(res => {
                if (res.data.code == 100000) {
                    that.getPublishSignList();
                    that.dialogFormVisible = false;
                } else {
                    that.$message(res.data.msg);
                }
            }).catch(error => {
                that.$message(error);
            });
        }
        ,
        delsPublishSign(row) {
            console.log("delsPublishSign", row);
            let that = this;
            axios.delete('/publishSign/delPublishSign/' + row.id).then(res => {
                console.log("delPublishSign", res);
                that.getPublishSignList();
            })
        }
        ,
        //更新或者新增
        submitForm(formName) {
            console.log("submitForm", this.$refs[formName]);
            let that = this;
            this.$refs[formName].validate((valid) => {
                if (valid) {
                    if (new Date(that.signForm.sign_time) > new Date(that.signForm.sign_last_time)) {
                        that.$message("签到时间不能大于最晚签到时间");
                        return;
                    }
                    if (this.isAdd) {
                        this.publishSign();
                    } else {
                        this.updatePublishSign();
                    }
                } else {
                    return false;
                }
            });
        }
    }
    ,

});