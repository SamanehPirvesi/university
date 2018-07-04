package com.example.utility;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalTime;
import java.util.Date;

public class DateUtil {
	public static String getDateToString(Date date) {

		SimpleDateFormat formatter2 = new SimpleDateFormat("dd/MM/yyyy");
		String dateToString = formatter2.format(date);
		return dateToString;
	}

	public static Date getStringToDate(String StringDate) throws ParseException {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-mm-dd");
		Date date = formatter.parse(StringDate);
		return date;

	}

	public static void compareTwoDates(Date date1, Date date2) {
		if (date1.compareTo(date2) > 0) {
			System.out.println("Date1 is after Date2");
		} else if (date1.compareTo(date2) < 0) {
			System.out.println("Date1 is before Date2");
		} else if (date1.compareTo(date2) == 0) {
			System.out.println("Date1 is equal to Date2");
		} else {
			System.out.println("How to get here?");
		}
	}
	/**
	 * convert time to double 
	 * @param t
	 * @param t2
	 * @return
	 */
	public static double calculateHours(LocalTime t ,LocalTime t2 ) {

		int t3=(t.getHour()*60)+(t.getMinute());
		int t4=(t2.getHour()*60)+(t2.getMinute());
		double t5=(double)(t3-t4)/60;
		return (t5);
		
	}
}
