public class SVMX_VF_RMA_UT {

    public static testmethod void test()
    {
        Account  account = TestDataProvider.getAccounts(1,'Customer','Customer')[0]; 
        insert account;
        
        Contact contact = TestDataProvider.getContacts(1,account.Id)[0];
        
        Case case1 = new Case(Status ='New', Priority = 'Medium',Origin = 'Email',ContactId =contact.Id,AccountId=account.Id,UNITY_Customer__c=account.Id); 
        insert case1; 
        
        RecordType[] rts = [SELECT Id, Name FROM RecordType WHERE SobjectType = 'SVMXC__RMA_Shipment_Order__c'];
        SVMXC__RMA_Shipment_Order__c PartsOrder;
         
        SVMXC__Site__c location1 = new SVMXC__Site__c(Name = 'loc1',SVMXC__Stocking_Location__c = true,SVMXC__Account__c = account.Id,SVMXC__Street__c = 'millers road',SVMXC__Country__c = 'india',SVMXC__Zip__c = '123456');
        //SVMXC__Stocking_Location__c =true,  
        insert location1;
         
        SVMXC__Site__c location2 = new SVMXC__Site__c(Name = 'loc2',SVMXC__Stocking_Location__c = true,SVMXC__Account__c = account.Id,SVMXC__Street__c = 'millers road',SVMXC__Country__c = 'india',SVMXC__Zip__c = '123456');
        //SVMXC__Stocking_Location__c =true,  
        insert location2;
                  
        SVMXC__RMA_Shipment_Order__c o1;
        for(RecordType rt : rts){ //Loop to take a record type at a time
        // Create Module Record
        if(rt.Name == 'Miner'){
            o1 = new SVMXC__RMA_Shipment_Order__c(RecordTypeId =rt.Id,SVMXC__Company__c = account.Id,SVMXC__Contact__c = contact.Id,SVMXC__Case__c = case1.id,SVMXC__Order_Status__c = 'open',SVMXC__Expected_Delivery_Date__c = system.today(),SVMXC__Source_Location__c = location1.Id,SVMXC__Destination_Location__c = location2.id);
            } 
        }
        try{
            o1.SVMXC__Order_Status__c = 'Open';
            insert o1;
            PageReference pageRef4 = new PageReference('Page.SVMX_VF_RMA?RecordId='+o1.Id+'&DispTYP=xls');
            Test.setCurrentPage(pageRef4);
            ApexPages.StandardController controller1 = new ApexPages.StandardController(o1);
            SVMX_VF_RMA controller2 = new SVMX_VF_RMA(controller1);
            controller2.getstrDispTyp();
            controller2.strDispTyp = 'pdf';
            controller2.getstrDispTyp();
            controller2.getcontype();
            
            controller2.getREPTAG001();
            controller2.getREPTAG002();
            controller2.getREPTAG003();
            controller2.getREPTAG004();
            controller2.getREPTAG005();
            
            Date d;
            DateTime dt;
            controller2.getFormattedDate(System.today());
            controller2.getFormattedDate(System.now());
            controller2.getFormattedDate(d);
            controller2.getFormattedDate(d);
            
            SVMX_VF_RMA.getFieldList(Schema.SObjectType.SVMXC__RMA_Shipment_Line__c.fields.getMap(), true);
            SVMX_VF_RMA.getFieldList(Schema.SObjectType.SVMXC__RMA_Shipment_Line__c.fields.getMap(), false);
            SVMX_VF_RMA.Wraper w = new SVMX_VF_RMA.Wraper( new SVMXC__RMA_Shipment_Order__c(), new list<SVMXC__RMA_Shipment_Line__c>() ); 
            w.getRMADate();
            w.getsObj();
            w.getlstsObj();
        }catch(exception ex){
            System.debug('============ Error: ' + ex.getMessage());
        }

    }
    public static testmethod void test2()
    {
        Account  account = TestDataProvider.getAccounts(1,'Customer','Customer')[0]; 
        insert account;
        
        Contact contact = TestDataProvider.getContacts(1,account.Id)[0];
        
        Case case1 = new Case(Status ='New', Priority = 'Medium',Origin = 'Email',ContactId =contact.Id,AccountId=account.Id,UNITY_Customer__c=account.Id); 
        insert case1; 
        
        RecordType[] rts = [SELECT Id, Name FROM RecordType WHERE SobjectType = 'SVMXC__RMA_Shipment_Order__c'];
        SVMXC__RMA_Shipment_Order__c PartsOrder;

        Map<String,String> prodMap = TestDataProvider.getProductAndPriceBookEntry(1);
        String pr2Id = '';
        for(String key :prodMap.keySet()){
            pr2Id = key;
			break;
        } 
         
        SVMXC__Site__c location1 = new SVMXC__Site__c(Name = 'loc1',SVMXC__Stocking_Location__c = true,SVMXC__Account__c = account.Id,SVMXC__Street__c = 'millers road',SVMXC__Country__c = 'india',SVMXC__Zip__c = '123456');
        //SVMXC__Stocking_Location__c =true,  
        insert location1;
         
        SVMXC__Site__c location2 = new SVMXC__Site__c(Name = 'loc2',SVMXC__Stocking_Location__c = true,SVMXC__Account__c = account.Id,SVMXC__Street__c = 'millers road',SVMXC__Country__c = 'india',SVMXC__Zip__c = '123456');
        //SVMXC__Stocking_Location__c =true,  
        insert location2;

        list<SVMXC__RMA_Shipment_Order__c> lstRMASO= new list<SVMXC__RMA_Shipment_Order__c>();
        SVMXC__RMA_Shipment_Order__c o1;
        SVMXC__RMA_Shipment_Order__c o2;
        for(RecordType rt : rts){ //Loop to take a record type at a time
        // Create Module Record
        if(rt.Name == 'Miner'){
            o1 = new SVMXC__RMA_Shipment_Order__c(RecordTypeId =rt.Id,SVMXC__Company__c = account.Id,SVMXC__Contact__c = contact.Id,SVMXC__Case__c = case1.id,SVMXC__Order_Status__c = 'open',SVMXC__Expected_Delivery_Date__c = system.today(),SVMXC__Source_Location__c = location1.Id,SVMXC__Destination_Location__c = location2.id);
            o2 = new SVMXC__RMA_Shipment_Order__c(RecordTypeId =rt.Id,SVMXC__Company__c = account.Id,SVMXC__Contact__c = contact.Id,SVMXC__Case__c = case1.id,SVMXC__Order_Status__c = 'open',SVMXC__Expected_Delivery_Date__c = system.today(),SVMXC__Source_Location__c = location1.Id,SVMXC__Destination_Location__c = location2.id);
            
            } 
        }
        try{
            string d = string.valueOf(math.random());
            o1.SVMXC__Order_Status__c = 'Open';
            o2.SVMXC__Order_Status__c = 'Open';
            lstRMASO.add(o1);
            lstRMASO.add(o2);
            insert lstRMASO;
            SVMXC__RMA_Shipment_Line__c oL1 = new SVMXC__RMA_Shipment_Line__c(SVMXC__RMA_Shipment_Order__c = o1.id,SVMXC__Product__c = pr2Id,SVMXC__Expected_Quantity2__c = 10,SVMXC__Line_Status__c = 'open');
            insert oL1;
            list<SVMXC__ServiceMax_List__c> lstSL = new list<SVMXC__ServiceMax_List__c>(); 
            SVMXC__ServiceMax_List__c oSL1 = new SVMXC__ServiceMax_List__c (SVMXC__Source_Location__c = d, SVMXC__Object_Id__c =o1.Id );
            SVMXC__ServiceMax_List__c oSL2 = new SVMXC__ServiceMax_List__c (SVMXC__Source_Location__c = d, SVMXC__Object_Id__c =o1.Id );
            
            lstSL.add(oSL1);
            lstSL.add(oSL2);
            insert lstSL;
            
            PageReference pageRef = new PageReference('Page.SVMX_VF_RMA?d='+d+'&DispTYP=doc');
            Test.setCurrentPage(pageRef);
            SVMX_VF_RMA controller2 = new SVMX_VF_RMA(null);
            controller2.lstRMA_Shipment.clear();
            controller2.lstRMA_Shipment.addAll(lstRMASO);
            controller2.getRMAShipment2();
        }catch(exception ex){
            System.debug('============ Error: ' + ex.getMessage());
        }
    }
}