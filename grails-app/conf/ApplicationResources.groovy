modules = {
    application {
        resource url:'js/application.js'
    }
	
	expenditure {
//		resource url: 'js/expenditure/debitors.js'
	}
	
	chosen {
		dependsOn 'jquery'
		resource url: 'js/chosen/chosen.jquery.min.js'
		resource url: 'css/chosen/chosen.min.css'
		resource url: 'js/chosen/runchosen.js'
	}
}