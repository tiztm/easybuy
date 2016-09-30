// JavaScript Document
function Delete(url,id)
{
	if(confirm("确定要删除吗？")) {
		location.href = url+"?id=" + id;
	}
}