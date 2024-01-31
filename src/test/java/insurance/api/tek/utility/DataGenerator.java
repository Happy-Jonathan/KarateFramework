package insurance.api.tek.utility;

import net.datafaker.Faker;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;

public class DataGenerator {

    public static String getEmail(){

        Faker faker = new Faker();
        return faker.name().firstName()+faker.name().lastName()+"@gmail.com";

    }

    public static String getFirstName(){

        Faker faker = new Faker();
        return faker.name().firstName();

    }

    public static String getLastName(){

        Faker faker = new Faker();
        return faker.name().lastName();

    }

    public static String getTitle(){

        Faker faker = new Faker();
        return faker.name().prefix().toUpperCase();

    }

    public static String getGender(){

        Faker faker = new Faker();
        return faker.gender().binaryTypes().toUpperCase();

    }

    public static String getEmploymentStatus(){

        Faker faker = new Faker();
        return faker.job().position();

    }

    public static String getMaritalStatus(){

        ArrayList<String> maritalStatus = new ArrayList<String>();
        maritalStatus.add("SINGLE");
        maritalStatus.add("MARRIED");
        maritalStatus.add("DIVORCED");
        maritalStatus.add("WIDOW");
        maritalStatus.add("WIDOWER");
        Collections.shuffle(maritalStatus);
        return maritalStatus.get(0);

    }

    public static String getDateOfBirth(){

        Faker faker = new Faker();
        Date date = faker.date().birthday();
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        return format.format(date);

    }

    public static String getPhoneNumber(){

        Faker faker = new Faker();
        return faker.phoneNumber().subscriberNumber(10);

    }

    public static String getPhoneExtension(){

        Faker faker = new Faker();
        return faker.phoneNumber().extension();

    }

    public static String getPhoneTime(){

        ArrayList<String> phoneTime = new ArrayList<String>();
        phoneTime.add("Morning");
        phoneTime.add("Afternoon");
        phoneTime.add("Evening");
        Collections.shuffle(phoneTime);
        return phoneTime.get(0);

    }

    public static String getPhoneType(){

        ArrayList<String> phoneType = new ArrayList<String>();
        phoneType.add("Home");
        phoneType.add("Cell Phone");
        phoneType.add("Business");
        Collections.shuffle(phoneType);
        return phoneType.get(0);

    }

    public static String getMake(){

        Faker faker = new Faker();
        return faker.vehicle().make();

    }

    public static String getModel(){

        Faker faker = new Faker();
        return faker.vehicle().model();

    }

    public static String getYear(){

        Faker faker = new Faker();
        return faker.number().digits(4);

    }

    public static String getLicensePlate(){

        Faker faker = new Faker();
        return faker.vehicle().licensePlate().replace("-","");

    }

public static String getAddressType(){

    ArrayList<String> addressType = new ArrayList<String>();
    addressType.add("House");
    addressType.add("Apartment");
    Collections.shuffle(addressType);
    return addressType.get(0);

}

    public static String getAddressLine1(){

        Faker faker = new Faker();
        return faker.address().streetAddress();

    }

    public static String getCity(){

        Faker faker = new Faker();
        return faker.address().cityName();

    }

    public static String getState(){

        Faker faker = new Faker();
        return faker.address().stateAbbr();

    }

    public static String getPostalCode(){

        Faker faker = new Faker();
        return faker.address().postcode();

    }

    public static String getCountryCode(){

        Faker faker = new Faker();
        return faker.address().countryCode();

    }

}
