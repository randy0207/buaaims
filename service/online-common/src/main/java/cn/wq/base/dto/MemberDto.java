package cn.wq.base.dto;

import lombok.Data;

import java.io.Serializable;

/**
 * @author LWQ
 * @since 2022/4/5
 */
@Data
public class MemberDto implements Serializable {
    private static final long serialVersionUID = 1L;
    private String id;// 会员id
    private String mobile;// 手机号
    private String nickname;// 昵称
}