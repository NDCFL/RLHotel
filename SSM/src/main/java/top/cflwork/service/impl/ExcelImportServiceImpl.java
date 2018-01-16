package top.cflwork.service.impl;

import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.stereotype.Component;
import top.cflwork.common.ExcelUtils;
import top.cflwork.common.ReflectUtils;
import top.cflwork.dto.ExcelImportDTO;
import top.cflwork.service.ExcelImportService;

import java.lang.reflect.Field;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * ExcelImportService服务实现类<br />
 * 创建于2017-12-18<br />
 *
 * @author 陈飞龙
 * @version 1.0
 */
@Component
public class ExcelImportServiceImpl implements ExcelImportService {

    @Override
    public List<Object> imports(Workbook workbook, ExcelImportDTO excelImportDTO) {
        Sheet sheet = workbook.getSheetAt(0);
        ExcelUtils excelUtils = new ExcelUtils();
        String destinationClass = excelImportDTO.getDestinationClass();
        String[] properties = excelImportDTO.getProperties();
        List<Object> rows = new ArrayList<>();
        try {
            Class clazz = Class.forName(destinationClass);
            for (int rowNo = excelImportDTO.getBeginRow(), totalRows = sheet.getLastRowNum(); rowNo <= totalRows; rowNo++) {
                Object rowObj = clazz.newInstance();
                for (int colNo = 0, len = properties.length ; colNo < len; colNo++) {
                    ReflectUtils.invokeSetter(rowObj, properties[colNo],
                            getCellValue(clazz, properties[colNo], excelUtils, sheet, rowNo, colNo));
                }
                rows.add(rowObj);
            }

        } catch (ClassNotFoundException | IllegalAccessException | InstantiationException e) {
            e.printStackTrace();
        }
        return rows;
    }

    private Object getCellValue(Class clazz, String property, ExcelUtils excelUtils, Sheet sheet, int rowNo, int colNo) {
        try {
            Field field = clazz.getDeclaredField(property);
            Class type = field.getType();
            if (type == String.class) {
                return excelUtils.getStringCellValueAt(sheet, rowNo, colNo);
            } else if (type == Date.class) {
                return excelUtils.getDateCellValueAt(sheet, rowNo, colNo);
            } else if (type == Double.class) {
                return excelUtils.getDoubleCellValueAt(sheet, rowNo, colNo);
            } else if (type == Integer.class) {
                return excelUtils.getIntegerCellValueAt(sheet, rowNo, colNo);
            } else if (type == Boolean.class) {
                return excelUtils.getBooleanCellValueAt(sheet, rowNo, colNo);
            } else if (type == Long.class) {
                return excelUtils.getLongCellValueAt(sheet, rowNo, colNo);
            } else if (type == BigDecimal.class) {
                return new BigDecimal(excelUtils.getDoubleCellValueAt(sheet, rowNo, colNo)).setScale(2, BigDecimal.ROUND_HALF_UP);
            }
        } catch (NoSuchFieldException e) {
            e.printStackTrace();
        }
        return null;
    }

}
