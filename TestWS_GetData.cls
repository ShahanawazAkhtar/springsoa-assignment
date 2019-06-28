@isTest
public class TestWS_GetData {
    
    public static TestMethod void testGetData(){
        Test.startTest();
        Test.setMock(HttpCalloutMock.class, new GetDataMock());
        Test.stopTest();
        
        WS_GetData.getData();
    }

}