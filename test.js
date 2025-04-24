var x,x2,ans;
    x=0;y=292941;ans=0;
    
var doc=document.getElementById('tes');//.textContent="ass";
var count=0;
kinji(x,y);

function kinji(x,y){
    
    ans=(x+y)/2;

    if(y-ans<0.001){
        console.log(count);
        doc.textContent=ans+'\n'+count+'回';      
    }else{
        count=count+1;
        
        kinji(x,ans);
    }
    
}