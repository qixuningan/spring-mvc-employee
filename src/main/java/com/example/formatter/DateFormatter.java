package com.example.formatter;

import org.springframework.format.Formatter;
import java.text.ParseException;
import java.util.Date;
import java.util.Locale;
import java.time.LocalDate;
import java.time.ZoneId;

public class DateFormatter implements Formatter<Date> {
    // 前端字符串转Date
    @Override
    public Date parse(String text, Locale locale) throws ParseException {
        LocalDate localDate = LocalDate.parse(text);  // 解析 yyyy-MM-dd 格式
        return Date.from(localDate.atStartOfDay(ZoneId.systemDefault()).toInstant());
    }

    // Date转前端字符串（页面回显用）
    @Override
    public String print(Date date, Locale locale) {
        return date.toInstant()
                .atZone(ZoneId.systemDefault())
                .toLocalDate()
                .toString();
    }
}