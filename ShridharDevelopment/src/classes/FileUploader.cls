public class FileUploader {

    public string nameFile{get;set;}
    public Blob contentFile{get;set;}
    String[] filelines = new String[]{};
        
    public Pagereference ReadFile()
    {
        nameFile=contentFile.toString();
        filelines = nameFile.split('\n');
        List<Merchandise__c> mer = new List<Merchandise__c>();        
       
        for (Integer i=1;i<filelines.size();i++)
        {
            system.debug('Called');
            String[] inputvalues = new String[]{};
            inputvalues = filelines[i].split(',');
            system.debug('Called' + inputvalues[0]);
            system.debug('Called' + inputvalues[1]);
            system.debug('Called' + inputvalues[2]);
            //Merchandise Name  Price   Quantity
            Merchandise__c m = new Merchandise__c();
            m.Name = inputvalues[0];
            m.Price__c   =  Integer.valueof(inputvalues[1]);
            system.debug(m.Price__c);
            //m.Quantity__c = Integer.valueOf(inputvalues[2]);
            mer.add(m);
            
        }
        try{           
            system.debug(mer.get(0));
            insert mer ;
        }
        catch (Exception e)
        {
            //ApexPages.Message errormsg = new ApexPages.Message(ApexPages.severity.ERROR,'An error has occured. Please check the template or try again later');
            //ApexPages.addMessage(errormsg);
        }    
        return null;
    }
}