package com.training.common.util;

import java.io.File;
import java.io.IOException;
import java.math.BigInteger;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.SecureRandom;
import java.util.Date;

import org.apache.commons.lang3.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import com.training.common.constant.Constants;

public class FileHelper {

	/**
	 * Save new file in server storage
	 * 
	 * @param parentFolderPath
	 * @param files
	 * @return files
	 * @throws IOException
	 */
	public static String addNewFile(String parentFolderPath, MultipartFile[] files) throws IOException {
		return editFile(parentFolderPath, files, null);
	}

	/**
	 * Save new file and remove old file in server storage
	 * 
	 * @param parentFolderPath
	 * @param files
	 * @param oldFilePath
	 * @return files
	 * @throws IOException
	 */
	public static String editFile(String parentFolderPath, MultipartFile[] files, String oldFilePath)
			throws IOException {
		// de viec luu ten file khong bi trung chung ta tao randomStr
		String randomStr = new BigInteger(130, new SecureRandom()).toString(32).substring(0, 6);
		// dung funtion cvDateToString(truye vao thoi gian hien tai, voi dinh dang DATE_FORMAT_FOR_FILE_NAME) chuyen qua String
		//noi lai voi randomStr thanh ten moi.
		String newFileName = CommonUtil.cvDateToString(new Date(), Constants.DATE_FORMAT_FOR_FILE_NAME) + Constants.COMMON_HYPHEN + randomStr;
		// phai co 1 funtion de dua vao he thong
		// lay file tu he thong(sau khi da luu vao he thong)
		String rootFolderPath = System.getProperty(Constants.PROP_KEY_ROOT_FOLDER);

		// originalFileName de lay ten goc cua file
		String originalFileName = files[0].getOriginalFilename();
		// tu ten goc cua file lay duoi file(lay tu dau cham cuoi cung cho den ket thuc file)
		String fileExtension = originalFileName.substring(originalFileName.lastIndexOf('.'), originalFileName.length());
		String assetPath = parentFolderPath + newFileName + fileExtension;
		//cuoi cung co ten day du(Path) de luu vao database
		String fullAssetPath = rootFolderPath + assetPath;

		// Create Folder To Save Video
		File parentFolder = new File(rootFolderPath + parentFolderPath);
		if (!parentFolder.exists()) {
			parentFolder.mkdirs();
		}

		if (StringUtils.isNotEmpty(oldFilePath)) {
	
			// Remove old file if it existed
			deleteFile(rootFolderPath, oldFilePath);
		}

		byte[] fileInByte = files[0].getBytes();
		Path path = Paths.get(fullAssetPath);
		Files.write(path, fileInByte);
		return assetPath;
	}

	/**
	 * Delete File
	 * 
	 * @param parentFolder
	 * @param fileName
	 */
	public static void deleteFile(String fileName) throws IOException {

		String rootFolderPath = System.getProperty(Constants.PROP_KEY_ROOT_FOLDER);
		File deletedFile = new File(rootFolderPath + fileName);
		if (deletedFile.exists()) {
			deletedFile.delete();
		}
	}

	/**
	 * Delete File
	 * 
	 * @param parentFolder
	 * @param fileName
	 */
	public static void deleteFile(String parentFolder, String fileName) throws IOException {

		File deletedFile = new File(parentFolder + fileName);
		if (deletedFile.exists()) {
			deletedFile.delete();
		}
	}
}