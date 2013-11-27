modules = {
    application {
        resource url:'js/application.js'
    }

    numeral {
        resource url:'js/numeral.min.js'
    }

	overrides {
        'jquery-theme' {
            resource id:'theme', url:'/css/smoothness/jquery-ui-1.10.3.custom.min.css'
        }
    }    
}