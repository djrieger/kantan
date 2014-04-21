package de.kantan

import grails.plugin.mail.MailService
import org.springframework.context.i18n.LocaleContextHolder
import groovy.text.SimpleTemplateEngine
import groovy.text.Template


/**
 * EmailNotificationService
 * A service class encapsulates the core business logic of a Grails application
 */
class EmailNotificationService {
	MailService mailService
	def messageSource

    def notifyOnNewExpenditure(Expenditure expenditure) {
		def engine = new SimpleTemplateEngine()
		Template template = engine.createTemplate(messageSource.getMessage('notification.expenditure.new.body', LocaleContextHolder.locale))
		
		expenditure.debitors.each { User debitor ->
			mailService.sendMail {
				to debitor.email
				from messageSource.getMessage('notification.expenditure.new.from', LocaleContextHolder.locale)
				body template.toString()
				subject messageSource.getMessage('notification.expenditure.new.subject', LocaleContextHolder.locale)
			}
		}
    }
}
