@isTest
public with sharing class AccountServiceLayerTest {
    @TestSetup
    static void makeData(){
        List<Account> testAccountsList = new List<Account>();
        Account testAccount = new Account(Name = 'Test Account', BillingPostalCode = '456-125');
        testAccountsList.add(testAccount);
		insert testAccountsList;
		
		List<Territory__C> testTerritoriesList = new List<Territory__C>();
		Territory__C testTerritory = new Territory__C();
		testTerritory.Name = '456-123';
		testTerritoriesList.add(testTerritory);
		insert testTerritoriesList;


	
    }

	@isTest
	private static void testOwnerIDChangeForBillingPostalCode(){
		List<Account> testAccountList = [SELECT ID,NAME,OwnerId,BillingPostalCode FROM Account];
		testAccountList[0].BillingPostalCode = '456-123';
		List<Territory__C> territoryList = [SELECT OwnerId from Territory__C];
		System.assertEquals(testAccountList[0].OwnerId, territoryList[0].OwnerID,'Account OwnerID is Different than the Territory OwnerId');


	}
}
