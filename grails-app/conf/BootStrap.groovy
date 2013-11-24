import com.jpos.Mlogin
import com.jpos.MloginRole
import com.jpos.MloginMloginRole

class BootStrap {

    def init = { servletContext ->
    	// def newUser = new Mlogin(username:'admin', enabled:true, password:'1').save(flush:true)
    	// def newRole = new MloginRole(authority: 'ROLE_ADMIN').save(flush:true)
    	// MloginMloginRole.create newUser, newRole, true
    }
    def destroy = {
    }
}
