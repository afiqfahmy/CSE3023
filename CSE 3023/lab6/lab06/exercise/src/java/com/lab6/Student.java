package com.lab6;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Student {

    private String stuno;
    private String name;
    private String program;

    public String getStuno() {
        Pattern p = Pattern.compile("^[A-Z]{2}[0-9]{5}$");
        Matcher m = p.matcher(stuno);

        if (m.matches()) {
            return stuno;
        } else {
            return "Invalid";
        }
    }

    public void setStuno(String stuno) {
        this.stuno = stuno;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getProgram() {
        return program;
    }

    public void setProgram(String program) {
        this.program = program;
    }
}
