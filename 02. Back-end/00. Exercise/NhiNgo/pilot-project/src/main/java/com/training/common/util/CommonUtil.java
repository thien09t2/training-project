package com.training.common.util;

import java.io.IOException;
import java.io.InputStream;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Properties;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.training.common.constant.Constants;

/**
 * @author DELL
 *
 */
public class CommonUtil {

	private static final Logger LOGGER = LoggerFactory.getLogger(CommonUtil.class);

	/**
	 * Convert date to string with input format
	 * 
	 * @param inputDate
	 * @param dateFormat
	 * @return outputDate
	 */
	public static String cvDateToString(Date inputDate, String dateFormat) {

		String outputDate = StringUtils.EMPTY;
		if (inputDate != null) {
			SimpleDateFormat dateFormatOutput = new SimpleDateFormat(dateFormat);
			outputDate = dateFormatOutput.format(inputDate);
		}

		return outputDate;
	}

	/**
	 * Convert date to string with input format and locale
	 * 
	 * @param inputDate
	 * @param dateFormat
	 * @return outputDate
	 */
	public static String cvDateToString(Date inputDate, String dateFormat, Locale locale) {

		String outputDate = StringUtils.EMPTY;
		if (inputDate != null) {
			SimpleDateFormat dateFormatOutput = new SimpleDateFormat(dateFormat, locale);
			outputDate = dateFormatOutput.format(inputDate);
		}

		return outputDate;
	}

	/**
	 * Convert String to Date
	 * 
	 * @param dateStr
	 * @param dateFormat
	 * @return Date
	 */
	public static Date cvStringToDate(String dateStr, String dateFormat) {

		Date outputDate = null;
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(dateFormat);
		try {
			outputDate = simpleDateFormat.parse(dateStr);
		} catch (ParseException e) {
			LOGGER.error("Error when converting data: " + e.getMessage());
		}

		return outputDate;
	}

	/**
	 * Read Properties
	 * 
	 * @param key
	 * @param fileName
	 * @return value
	 */
	public static String readProperties(String key, String fileName) {

		InputStream inputStream = CommonUtil.class.getClassLoader().getResourceAsStream(fileName);
		Properties prop = new Properties();
		try {
			prop.load(inputStream);
			return prop.getProperty(key);
		} catch (IOException e) {
			System.out.println("Error warning: " + e.getMessage());
		}
		return null;
	}

	/**
	 * Convert Number to Currency format
	 * 
	 * @param inputDate
	 * @param dateFormat
	 * @return outputDate
	 */
	public static String cvNumberToCurrency(Double dblNum) {

		DecimalFormat df = new DecimalFormat(Constants.CURRENCY_FORMAT);
		DecimalFormatSymbols dfsymbol = new DecimalFormatSymbols(Locale.getDefault());
		dfsymbol.setGroupingSeparator(',');
		df.setDecimalFormatSymbols(dfsymbol);

		String formattedCurr = null;
		try {
			formattedCurr = df.format(dblNum);
		} catch (Exception e) {
			LOGGER.error("Error when converting currency: " + e.getMessage());
		}

		return formattedCurr;
	}
}
