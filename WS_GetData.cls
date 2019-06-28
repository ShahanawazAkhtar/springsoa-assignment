public class WS_GetData {
    
    public static void getData(){
        Http h = new Http();   
        HttpRequest req = new HttpRequest(); 
        req.setMethod('GET');       
        req.setEndpoint('https://postman-echo.com/get?foo1=bar1&foo2=bar2');
        req.setTimeout(120000);
        req.setHeader('Content-Type', 'application/json');
        req.setHeader('Accept', 'application/json');
        HttpResponse res = h.send(req); 
        system.debug('res body-->'+res.getBody());
    }
}