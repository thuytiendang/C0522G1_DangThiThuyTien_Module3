package common;

import java.util.regex.Pattern;

public class Validation {
    private static final String NAME = "^([\\p{Lu}][\\p{Ll}]{1,8})(\\s([\\p{Lu}]|[\\p{Lu}][\\p{Ll}]{1,10})){0,5}$";
    private static final String EMAIL = "^[a-z]+([\\_\\.]?[a-z\\d]+)*@[a-z]{3,7}\\.[a-z]{2,3}$";
    private static final String PHONE = "^(090|091|\\(\\+84\\)90|\\(\\+84\\)91)\\d{7}$";
    private static final String ID_CARD = "^(\\d{9}|\\d{12})$";
    private static final String CUSTOMER_CODE = "^(KH-)\\d{4}$";

    public static boolean validateName(String string){
        return Pattern.matches(NAME,string);
    }
     public static boolean validatePhone(String string){
        return Pattern.matches(PHONE,string);
     }

    public static boolean validateIDCard(String string){
        return Pattern.matches(ID_CARD,string);
    }

    public static boolean validateEmail(String string){
        return Pattern.matches(EMAIL,string);
    }


}
