<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<s:if test="hlist.size==0"><h1>您还没关注该类型房源哦！</h1></s:if>
  <s:iterator value="hlist">
  
     <dl>
      <dt> <s:if test="hstatus=='下架'"><a onclick="tell"></s:if><s:if test="hstatus=='上架'"><a href="hd_query?houseid=${houseid}"></s:if><img src="<s:property value="imgurl"/>" width="190" height="128" /></a></dt>
      <dd>
       <h3><s:if test="hstatus=='下架'"><a onclick="tell"></s:if><s:if test="hstatus=='上架'"><a href="hd_query?houseid=${houseid}"></s:if><s:property value="housename"/></a></h3>
       <div class="guantext">${haddress}</div>
        <div class="guantext">${typeid.room }室 ${typeid.hall}厅${typeid.toilet}卫| ${area}.0平米 | ${orientation.ctext}</div>
        <div class="guantext2"> <a href="javascript:;" class="qxgz" onclick="deletef(${houseid},${renttype.cid })">取消关注</a></div>
       </dd>
      <s:if test="hstatus=='下架'"><h1>该房源已下架</h1></s:if>
       <div class="price">¥ <s:if test="renttype.cid==1"><strong>${rentmoney }</strong><span class="font12">元/月</span></s:if>
	 	<s:if test="renttype.cid!=1"><strong>${rentmoney/10000 }</strong><span class="font12">万</span></s:if></div>
       <div class="clearfix"></div>
      </dl>
        </s:iterator>
     
