	function generateId(type){
		var agentId="";
		if(type==0){
			agentId="AGE";
		}else if(type==1){
			agentId="TER";
		}
	
		var curDate=new Date().Format('yyyyMMddhhmmss');
		
		agentId+=curDate+Math.floor(Math.random()*999+1);
		
		return agentId;
	}
