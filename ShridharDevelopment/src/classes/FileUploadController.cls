public class FileUploadController {

    public PageReference upload() {
        system.debug(UserInfo.getUserId());
        system.debug(UserInfo.getUserId());
        document.AuthorId = UserInfo.getUserId();
        document.FolderId = UserInfo.getUserId(); // put it in running user's folder
        system.debug(UserInfo.getName());
        system.debug(UserInfo.getName());
        
        try {
            system.debug('hi');
                system.debug(document);
              insert document;             
              
        } catch (DMLException e) {
              ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR,'Error uploading file'));
              return null;
        } finally {
              document.body = null; // clears the viewstate
              document = new Document();
        }
        ApexPages.addMessage(new ApexPages.message(ApexPages.severity.INFO,'File uploaded successfully'));
        return null;
    }
    
    public Document document {
        get {
            if (document == null){
            document = new Document();
            system.debug(Document.Url);
            }    
          return document;
        }
        set;
    }

}