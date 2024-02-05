package users.delete;

import com.intuit.karate.junit5.Karate;

public class UserGetRunner2 {

    @Karate.Test
    Karate userGet(){
        return Karate.run("user-put").relativeTo(getClass());
    }
}
