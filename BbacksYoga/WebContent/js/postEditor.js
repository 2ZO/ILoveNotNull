
	// iframe에 글을 쓸 수 있음
	$(document).ready(function() {
		dhtmlframe.document.designMode = "On";
	})
	// iframe에 editor 기능들 적용
	function htmledit(execute,values)
	{
	        if(values==null)
	        {
	                dhtmlframe.document.execCommand(execute);
	        }
	        else
	        {
	                dhtmlframe.document.execCommand(execute,"",values);
	        }
	}
	
	//iframe 내용을 textarea로 전송
    function datasubmit()
    {
            form.content.value = dhtmlframe.document.body.innerHTML;
    }

