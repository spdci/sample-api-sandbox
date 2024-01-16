package com.example.springjsonlddemo.utils;

import com.example.springjsonlddemo.pojo.ibr.Person;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializerProvider;
import com.fasterxml.jackson.databind.node.ArrayNode;
import com.fasterxml.jackson.databind.node.JsonNodeFactory;
import com.fasterxml.jackson.databind.node.ObjectNode;

import java.io.IOException;
import java.util.Collection;
import java.util.List;

public class PersonSerializer extends JsonSerializer<Person> {

    private static final JsonNodeFactory jsonNodeFactory = JsonNodeFactory.instance;

    private JsonNode serializeNestedObject(Object nestedObject, String type) {
        if (nestedObject == null) {
            return null;
        }

        if (nestedObject instanceof Collection<?> collection) {
            ArrayNode arrayNode = jsonNodeFactory.arrayNode();

            for (Object item : collection) {
                ObjectNode itemNode = jsonNodeFactory.objectNode();
                itemNode.put("@id", type);
                itemNode.put("@type", type);

                ObjectMapper mapper = new ObjectMapper();
                itemNode.setAll(mapper.convertValue(item, ObjectNode.class));

                arrayNode.add(itemNode);
            }

            return arrayNode;
        } else {
            ObjectNode nestedNode = jsonNodeFactory.objectNode();
            nestedNode.put("@id", type);
            nestedNode.put("@type", type);

            ObjectMapper mapper = new ObjectMapper();
            nestedNode.setAll(mapper.convertValue(nestedObject, ObjectNode.class));

            return nestedNode;
        }

    }

    private JsonNode serializeNestedObjectList(List<?> nestedObjectList, String type) {
        ArrayNode arrayNode = jsonNodeFactory.arrayNode();

        for (Object nestedObject : nestedObjectList) {
            arrayNode.add(serializeNestedObject(nestedObject, type));
        }

        return arrayNode;
    }

    @Override
    public void serialize(Person person, JsonGenerator jsonGenerator, SerializerProvider serializerProvider) throws IOException {
        ObjectNode personNode = jsonNodeFactory.objectNode();
        personNode.put("@id", "Person");
        personNode.put("@type", "Person");

        personNode.put("spdci:household_status", person.getHouseholdStatus());
        personNode.put("spdci:benefiting_entity", person.getBenefitingEntity());
        personNode.put("spdci:sex", person.getSex());
        personNode.put("spdci:birth_date", person.getBirthDate());
        personNode.put("spdci:sub_region_code", person.getSubRegionCode());
        personNode.put("spdci:marital_status", person.getMaritalStatus());
        personNode.put("spdci:poverty_score", person.getPovertyScore());
        personNode.put("spdci:is_disabled", person.getIsDisabled());
        personNode.put("spdci:household_identifier", person.getHouseholdIdentifier());


        personNode.set("identifier", serializeNestedObject(person.getIdentifier(), "Identifier"));
        personNode.set("name", serializeNestedObject(person.getName(), "Name"));
        personNode.set("programme", serializeNestedObjectList(person.getProgramme(), "Programme"));
        personNode.set("benefit", serializeNestedObjectList(person.getBenefit(), "Benefit"));
        personNode.set("payroll", serializeNestedObjectList(person.getPayroll(), "Payroll"));
        jsonGenerator.writeObject(personNode);
    }

}