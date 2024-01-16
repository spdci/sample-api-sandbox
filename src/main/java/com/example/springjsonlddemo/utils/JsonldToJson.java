package com.example.springjsonlddemo.utils;

import com.example.springjsonlddemo.dto.PersonRecord;
import com.example.springjsonlddemo.pojo.ibr.Person;
import com.example.springjsonlddemo.pojo.request.Expression;
import com.example.springjsonlddemo.pojo.request.QueryExpression;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.databind.module.SimpleModule;
import com.github.jsonldjava.core.JsonLdOptions;
import com.github.jsonldjava.core.JsonLdProcessor;
import com.github.jsonldjava.utils.JsonUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Field;
import java.net.URL;
import java.util.*;

@Component
@Slf4j
public class JsonldToJson {

    InputStream inputStream;

    @Autowired
    ObjectMapper mapper;

    private static void setPropertyValue(Person person, String propertyName, String propertyValue) throws IllegalAccessException {
        try {
            Field field = Person.class.getDeclaredField(propertyName);
            field.setAccessible(true);
            field.set(person, propertyValue);
        } catch (NoSuchFieldException e) {
            System.err.println("Field not found: " + propertyName);
        }
    }

//    public PersonRecord jsonToJavaObjMapper() {
//        PersonRecord person = new PersonRecord();
//        try {
//
//            inputStream = new FileInputStream("Person.json");
//            Object jsonObject = JsonUtils.fromInputStream(inputStream);
//
//            Object compact = JsonLdProcessor.compact(jsonObject, new HashMap<>(), new JsonLdOptions());
//
//            //convert JSOn to String
//            String compactContent = JsonUtils.toPrettyString(compact);
//            log.info("Content======= " + compactContent);
//
//            ObjectMapper mapper = new ObjectMapper();
//            person = mapper.readValue(compactContent, PersonRecord.class);
//
//            log.info("Person Data=== " + person);
//
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//
//        return person;
//    }

    public Person jsonldToJavaObjMapper() throws IOException {

        String fileName = "https://schema.spdci.org/extensions/ibr/v1/Person.jsonld";

        HttpHeaders headers = new HttpHeaders();
        headers.setAccept(Collections.singletonList(MediaType.APPLICATION_JSON));

        HttpEntity<?> entity = new HttpEntity<>(headers);
        RestTemplate template = new RestTemplate();
        ResponseEntity<String> res = template.getForEntity(fileName, String.class);
        String responseBody = res.getBody();

        System.out.println("Raw Response Body: " + responseBody);

        Object jsonObject = JsonUtils.fromString(responseBody);

        Object compact = JsonLdProcessor.compact(jsonObject, new HashMap<>(), new JsonLdOptions());

        //convert JSOn to String
        String compactContent = JsonUtils.toPrettyString(compact);
        log.info("Content======= " + compactContent);

        ObjectMapper mapper = new ObjectMapper();
        SimpleModule module = new SimpleModule();
//        module.addDeserializer(Person.class, new PersonDeserializer());
//        mapper.registerModule(module);

        Person person = mapper.readValue(compactContent, Person.class);

        return person;
    }


//    public Person mapFromJsonLdSchema(String jsonLdSchemaUrl, Map<String, String> jsonData) throws IOException, IllegalAccessException {
//        // Fetch JSON-LD schema from the URL
//        ResponseEntity<String> responseEntity = new RestTemplate().getForEntity(jsonLdSchemaUrl, String.class);
//        String jsonLdSchema = responseEntity.getBody();
//
//        // Parse JSON-LD schema
//        ObjectMapper mapper = new ObjectMapper();
//        JsonNode schemaNode = mapper.readTree(jsonLdSchema);
//
//        Person person = new Person();
//
//        // Iterate over the properties in the JSON-LD schema
//        Iterator<Map.Entry<String, JsonNode>> fields = schemaNode.fields();
//        while (fields.hasNext()) {
//            Map.Entry<String, JsonNode> entry = fields.next();
//            String propertyName = entry.getKey();
//
//            // Assuming that the jsonData map contains values for the JSON-LD properties
//            String propertyValue = jsonData.get(propertyName);
//
//            // Set the property in the Person object using reflection
//            setPropertyValue(person, propertyName, propertyValue);
//        }
//
//        return person;
//    }


//        public void jsonldToJavaObjMapper() throws IOException {
//
//        String fileName = "https://schema.spdci.org/extensions/ibr/v1/Person.jsonld";
//        HttpHeaders headers = new HttpHeaders();
//        headers.setAccept(Collections.singletonList(MediaType.APPLICATION_JSON));
//
//        HttpEntity<?> entity = new HttpEntity<>(headers);
//        RestTemplate template = new RestTemplate();
//        ResponseEntity<String> res = template.getForEntity(fileName, String.class);
//        String responseBody = res.getBody();
//
//        System.out.println("Raw Response Body: " + responseBody);
//
//        // Convert JSON-LD to JSON
//        LinkedHashMap<String, Object> jsonNode = (LinkedHashMap<String, Object>) JsonUtils.fromString(responseBody);
//
//        System.out.println("JosnNode==="+jsonNode);
//        Map<String, Object> jsonMap = (Map<String, Object>) JsonLdProcessor.toRDF(jsonNode, new JsonLdOptions());
//
//        //to json
//        String json = mapper.writeValueAsString(jsonMap);
//        System.out.println("Person -----------"+mapper.readValue(json, Person.class));
//
//         mapper.readValue(json, Person.class);
//    }


//    public Map<String, String> jsonldToJavaObjMapper() throws IOException {
//
//        Person person = new Person();
//        String fileName = "https://schema.spdci.org/extensions/ibr/v1/Person.jsonld";
//
//        HttpHeaders headers = new HttpHeaders();
//        headers.setAccept(Collections.singletonList(MediaType.APPLICATION_JSON));
//
//        HttpEntity<?> entity = new HttpEntity<>(headers);
//        RestTemplate template = new RestTemplate();
//        ResponseEntity<String> res = template.getForEntity(fileName, String.class);
//        String responseBody = res.getBody();
//
//        System.out.println("Raw Response Body: " + responseBody);
//
//        Object jsonObject = JsonUtils.fromString(responseBody);
////
//        Object compact = JsonLdProcessor.compact(jsonObject, new HashMap<>(), new JsonLdOptions());
//
//        //convert JSOn to String
//        String compactContent = JsonUtils.toPrettyString(compact);
//        log.info("Content======= " + compactContent);
//
//        //map json to Pojo
//        ObjectMapper mapper = new ObjectMapper();
//        JsonNode jsonNode = mapper.readTree(compactContent);
//        Map<String, String> mapped = new HashMap<>();
//        jsonNode.fields().forEachRemaining(e -> {
//            String property = e.getKey();
//            String value = "";
//            mapped.put(property, value);
//        });
//        return mapped;
//
//    }

    public List<Map<String, String>> transformPersonList(List<Person> personDataList) {
        List<Map<String, String>> transformedList = new ArrayList<>();

        for (Person person : personDataList) {
            Map<String, String> transformedMap = new HashMap<>();

            // Iterate over the fields of the Person class
            for (Field field : Person.class.getDeclaredFields()) {
                JsonProperty jsonProperty = field.getAnnotation(JsonProperty.class);
                if (jsonProperty != null) {
                    // Get the schema URL from the @JsonProperty annotation
                    String schemaUrl = jsonProperty.value();
                    System.out.println("Schema url-------" + schemaUrl);
                    // Set the field accessible to read its value
                    field.setAccessible(true);
                    try {
                        String value = String.valueOf(field.get(person));

                        transformedMap.put(schemaUrl, value);
                    } catch (IllegalAccessException e) {
                        e.printStackTrace();
                    }
                }
            }

            transformedList.add(transformedMap);
        }

        return transformedList;
    }

    public QueryExpression mapToQueryExpression(Map<String, Object> expressionQueryMap) {
        QueryExpression queryExpression = new QueryExpression();
        queryExpression.setSeqNum((int) expressionQueryMap.get("seq_num"));
        queryExpression.setCondition((String) expressionQueryMap.get("condition"));

        Map<String, Object> expression1Map = (Map<String, Object>) expressionQueryMap.get("expression1");
        queryExpression.setExpression1(mapToExpression(expression1Map));

        Map<String, Object> expression2Map = (Map<String, Object>) expressionQueryMap.get("expression2");
        queryExpression.setExpression2(mapToExpression(expression2Map));

        return queryExpression;
    }

    private Expression mapToExpression(Map<String, Object> expressionMap) {
        try {
            System.out.println(mapper.convertValue(expressionMap, Expression.class));
            return mapper.convertValue(expressionMap, Expression.class);
        } catch (IllegalArgumentException e) {
            e.printStackTrace();
        }
        return null;
    }
}
