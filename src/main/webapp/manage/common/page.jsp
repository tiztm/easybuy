<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<table class="list">
    <tfoot>
    <tr align="right">
        <td class="first w4 c" colspan="5">
            <form action="${nextAction}" method="get" id="navigatorForm">
                <c:if test="${pageNumber>2}">
                    <a href="${nextAction}?pageNumber=1">首页</a></c:if>
                <c:if test="${pageNumber>1}">
                    <a href="${nextAction}?pageNumber=${pageNumber-1}">上一页</a>
                </c:if>
                第<select name="pageNumber" onchange="gotoSelectedPage('navigatorForm');">
                <c:forEach begin="1" end="${totalPages}" step="1" var="pageIndex">
                    <c:choose>
                        <c:when test="${pageIndex eq pageNumber}">
                            <option value="${pageIndex}" selected="selected">${pageIndex}</option>
                        </c:when>
                        <c:otherwise>
                            <option value="${pageIndex}">${pageIndex}</option>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </select>页
                <c:if test="${pageNumber<totalPages}">
                    <a href="${nextAction}?pageNumber=${pageNumber+1}">下一页</a></c:if>
                <c:if test="${pageNumber<totalPages-1}">
                    <a href="${nextAction}?pageNumber=${totalPages}">末页</a></c:if> 共${totalUsers}名用户
            </form>
        </td>
    </tr>
    </tfoot>
</table>