package com.kc.plat.model.vo;

import lombok.Data;

/**
 * 统计Vo
 */
@Data
public class SignTotalVo {
  //未签到
  private String withoutSign;
  //签到总数
  private String signTotal;
  //正常签到
  private String normalSign;
  //迟到签到
  private String lateSign;
  //统计日期
  private String totalDate;

}
