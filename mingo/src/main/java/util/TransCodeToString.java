/*
package util;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;


import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.*;

import vo.CafeFacilitiesVO;

public class TransCodeToString {
	
	public CafeFacilitiesVO transCafeFacilities(CafeFacilitiesVO vo, String jsonPath) throws FileNotFoundException, IOException, ParseException {
		JSONParser parser = new JSONParser();
		JSONObject faciCodeBook = (JSONObject) parser.parse(new FileReader(jsonPath));
		
		faciCodeBook.
		
		int key =
		
		Integer.toString(vo.getWifi());
		vo.setWifi(faciCodeBook.get("wifi").get());
		return vo;
	}

}
*/
