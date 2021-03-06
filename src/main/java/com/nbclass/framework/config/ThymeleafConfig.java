package com.nbclass.framework.config;

import com.nbclass.framework.config.properties.ZbProperties;
import org.springframework.context.annotation.Configuration;
import org.thymeleaf.spring5.SpringTemplateEngine;
import org.thymeleaf.templateresolver.FileTemplateResolver;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;

@Configuration
public class ThymeleafConfig {

    @Resource
    private SpringTemplateEngine templateEngine;
    @Resource
    private ZbProperties zbProperties;

    @PostConstruct
    public void extension() {
        FileTemplateResolver resolver = new FileTemplateResolver();
        resolver.setPrefix(zbProperties.getWorkTemplateDir());
        resolver.setSuffix(".html");
        resolver.setTemplateMode("HTML5");
        resolver.setCharacterEncoding("UTF-8");
        resolver.setOrder(templateEngine.getTemplateResolvers().size());
        resolver.setCacheable(false);
        templateEngine.addTemplateResolver(resolver);
    }
}