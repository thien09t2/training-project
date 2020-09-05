package com.training.common.util;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializerProvider;
import com.training.common.constant.Constants;

/**
 * Json Date Serializer
 * 
 * @author Chiem Lam Mai
 * @since 07-09-2019
 */
@Component
public class JsonDateSerializer extends JsonSerializer<Date> {

	private static final SimpleDateFormat sdf = new SimpleDateFormat(Constants.DATE_FORMAT_FOR_INPUT);

	/**
	 * Format Date to Json
	 * 
	 * @param Date
	 * @param JsonGenerator
	 * @param SerializerProvider
	 */
	@Override
	public void serialize(Date date, JsonGenerator gen, SerializerProvider serializers)
			throws IOException, JsonProcessingException {

		String formattedDate = sdf.format(date);
		gen.writeString(formattedDate);
	}

}
