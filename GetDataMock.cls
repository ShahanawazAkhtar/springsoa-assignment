@isTest
global class GetDataMock implements HttpCalloutMock{
    
    global HTTPResponse respond(HTTPRequest req){
        HttpResponse res = new HttpResponse();
        res.setBody('{"args":{"foo1":"bar1","foo2":"bar2"},"headers":{"x-forwarded-proto":"https","host":"postman-echo.com","accept":"text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3","accept-encoding":"gzip, deflate, br","accept-language":"en-GB,en-US;q=0.9,en;q=0.8","cookie":"sails.sid=s%3Akj4lWgfD0goRmLeaXZdYbkv9VSGydVKi.0iv%2Bkn6zTGnD29RjCJP7pN8RugM6iH3iX5dDwfahso0","if-none-match":"W/\"2d9-jutk87B87KpExNcZc/43YcJ+kdw\"","upgrade-insecure-requests":"1","user-agent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36","x-forwarded-port":"443"},"url":"https://postman-echo.com/get?foo1=bar1&foo2=bar2"}');
        res.setStatusCode(200);
        return res;
    }
    
}