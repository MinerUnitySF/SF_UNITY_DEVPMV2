global class UNITY_ScheduleEmailToVendorCOIExpiration implements Schedulable
{
    global void execute(SchedulableContext sc)    {
        
        UNITY_VendorExpirationCOINotification expirationCOINotification = new UNITY_VendorExpirationCOINotification ();
        database.executebatch(expirationCOINotification,200);
    }
   
}