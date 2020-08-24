package com.training.config;

import javax.servlet.ServletContext;

import org.springframework.boot.web.servlet.ServletContextInitializer;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

import com.training.common.constant.Constants;
import com.training.common.util.CommonUtil;

// dua file vao he thong
/**
 * Add configuration for application on start up
 * 
 * @author Red Devil
 * @since 2020-02-20
 */
// day la noi dinh nghia cua cac bean va cau hinh he thong
@Configuration
@ComponentScan(basePackages = "com.training")
public class ServletContextInitializerConfig implements ServletContextInitializer {
//khi khai bao  @Configuration, nhung cau lenh trong funtion onStartup se chay sau khi ung dung spring chay
// doc file config/application.properties de lay file cha(properti) trong do va luu vao bien the thong (System) 
// voi key la PROP_KEY_ROOT_FOLDER = "root.storage.folder
	@Override
	public void onStartup(ServletContext servletContext) {
		System.setProperty(Constants.PROP_KEY_ROOT_FOLDER, CommonUtil.readProperties(Constants.PROP_KEY_ROOT_FOLDER, "config/application.properties"));
	}
}