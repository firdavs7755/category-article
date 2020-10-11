package uz.lesson.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtils {
    private static SimpleDateFormat dateFormat ;

    static {//static constructor
        dateFormat = new SimpleDateFormat("HH:mm|dd.MM.YYYY");
    }
    public static String formatDate(Date date){
        return dateFormat.format(date);
    }
}
