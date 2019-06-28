public class AccountController {
    
    @auraEnabled
    public static List<Account> getAccountList(){
        return [Select id, Name, Type From Account Order By CreatedDate DESC LIMIT 10];
    }
}