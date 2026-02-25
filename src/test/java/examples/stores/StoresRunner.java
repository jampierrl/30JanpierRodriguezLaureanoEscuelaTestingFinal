package examples.stores;

import com.intuit.karate.junit5.Karate;

class StoresRunner {
    
    @Karate.Test
    Karate testUsers() {
        return Karate.run("stores").relativeTo(getClass());
    }    

}

