package top.zywork.common;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import top.zywork.enums.MIMETypeEnum;

import java.io.*;
import java.util.Date;

/**
 * Excel文档工具类<br />
 * 创建于2017-10-30
 *
 * @author 王振宇
 * @version 1.0
 */
public class ExcelUtils {

    private Workbook workbook;

    /**
     * 判断指定路径的文件是否为excel文件
     * @param path 文件路径
     * @return 如果是.xls或.xlsx后缀，则返回true，否则返回false
     */
    public static boolean isExcel(String path) {
        return FileUtils.checkExtension(path, MIMETypeEnum.XLS.getExt() + "," + MIMETypeEnum.XLSX.getExt());
    }

    /**
     * 从指定的输入流中读取excel文件
     * @param inputStream 输入流
     * @param mimeTypeEnum 文件类型枚举，可以是xls或xlsx文件
     * @return Excel文档对应的Workbook对象
     */
    public Workbook readExcel(InputStream inputStream, MIMETypeEnum mimeTypeEnum) {
        try {
            if (mimeTypeEnum == MIMETypeEnum.XLS) {
                workbook = new HSSFWorkbook(inputStream);
            } else if (mimeTypeEnum == MIMETypeEnum.XLSX) {
                workbook = new XSSFWorkbook(inputStream);
            }
            inputStream.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return workbook;
    }

    /**
     * 根据指定的文件路径读取excel文件
     * @param path 文件路径
     * @param mimeTypeEnum 文件类型枚举，可以是xls或xlsx文件
     * @return Excel文档对应的Workbook对象
     */
    public Workbook readExcel(String path, MIMETypeEnum mimeTypeEnum) {
        try {
            readExcel(new FileInputStream(new File(path)), mimeTypeEnum);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return workbook;
    }

    /**
     * 创建新的excel文档
     * @param mimeTypeEnum 文件类型枚举，指定是创建xls文档还是xlsx文档
     * @return 新创建的excel文档对应的Workbook对象
     */
    public Workbook newExcel(MIMETypeEnum mimeTypeEnum) {
        if (mimeTypeEnum == MIMETypeEnum.XLS) {
            workbook = new HSSFWorkbook();
        } else if (mimeTypeEnum == MIMETypeEnum.XLSX) {
            workbook = new XSSFWorkbook();
        }
        return workbook;
    }

    /**
     * 把excel文档重新保存到指定的文件
     * @param path 新的文件路径
     */
    public void writeExcel(String path) {
        try {
            FileOutputStream outputStream = new FileOutputStream(new File(path));
            workbook.write(outputStream);
            outputStream.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 获取指定工作表指定行指定列的布尔数据
     * @param sheet 工作表对象
     * @param rowNo 指定行
     * @param columnNo 指定列
     * @return true或false
     */
    public boolean getBooleanCellValueAt(Sheet sheet, int rowNo, int columnNo) {
        return sheet.getRow(rowNo).getCell(columnNo).getBooleanCellValue();
    }

    /**
     * 获取指定工作表指定行指定列的字符串数据
     * @param sheet 工作表对象
     * @param rowNo 指定行
     * @param columnNo 指定列
     * @return 字符串
     */
    public String getStringCellValueAt(Sheet sheet, int rowNo, int columnNo) {
        return sheet.getRow(rowNo).getCell(columnNo).getStringCellValue();
    }

    /**
     * 获取指定工作表指定行指定列的整数数据
     * @param sheet 工作表对象
     * @param rowNo 指定行
     * @param columnNo 指定列
     * @return 整数
     */
    public int getIntegerCellValueAt(Sheet sheet, int rowNo, int columnNo) {
        return (int) getDoubleCellValueAt(sheet, rowNo, columnNo);
    }

    /**
     * 获取指定工作表指定行指定列的浮点数数据
     * @param sheet 工作表对象
     * @param rowNo 指定行
     * @param columnNo 指定列
     * @return 浮点数
     */
    public double getDoubleCellValueAt(Sheet sheet, int rowNo, int columnNo) {
        return sheet.getRow(rowNo).getCell(columnNo).getNumericCellValue();
    }

    /**
     * 获取指定工作表指定行指定列的时间数据
     * @param sheet 工作表对象
     * @param rowNo 指定行
     * @param columnNo 指定列
     * @return 时间
     */
    public Date getDateCellValueAt(Sheet sheet, int rowNo, int columnNo) {
        return sheet.getRow(rowNo).getCell(columnNo).getDateCellValue();
    }

    /**
     * 设置指定工作表指定行指定列的布尔数据
     * @param sheet 工作表对象
     * @param rowNo 指定行
     * @param columnNo 指定列
     * @param value 数据
     */
    public void setBooleanCellValueAt(Sheet sheet, int rowNo, int columnNo, boolean value) {
        sheet.getRow(rowNo).getCell(columnNo).setCellValue(value);
    }

    /**
     * 设置指定工作表指定行指定列的字符串数据
     * @param sheet 工作表对象
     * @param rowNo 指定行
     * @param columnNo 指定列
     * @param value 数据
     */
    public void setStringCellValueAt(Sheet sheet, int rowNo, int columnNo, String value) {
        sheet.getRow(rowNo).getCell(columnNo).setCellValue(value);
    }

    /**
     * 设置指定工作表指定行指定列的整数数据
     * @param sheet 工作表对象
     * @param rowNo 指定行
     * @param columnNo 指定列
     * @param value 数据
     */
    public void setIntegerCellValueAt(Sheet sheet, int rowNo, int columnNo, int value) {
        sheet.getRow(rowNo).getCell(columnNo).setCellValue(value);
    }

    /**
     * 设置指定工作表指定行指定列的浮点数数据
     * @param sheet 工作表对象
     * @param rowNo 指定行
     * @param columnNo 指定列
     * @param value 数据
     */
    public void setDoubleCellValueAt(Sheet sheet, int rowNo, int columnNo, double value) {
        sheet.getRow(rowNo).getCell(columnNo).setCellValue(value);
    }

    /**
     * 设置指定工作表指定行指定列的时间数据
     * @param sheet 工作表对象
     * @param rowNo 指定行
     * @param columnNo 指定列
     * @param value 数据
     */
    public void setDateCellValueAt(Sheet sheet, int rowNo, int columnNo, Date value) {
        sheet.getRow(rowNo).getCell(columnNo).setCellValue(value);
    }

    /**
     * 在指定工作表的指定位置插入图片
     * @param sheet 工作表
     * @param imagePath 图片路径
     * @param leftDX 图片在单元格中离左上角的x距离
     * @param topDY 图片在单元格中离左上角的y距离
     * @param widthDX 图片的宽度
     * @param heightDY 图片的高度
     * @param beginRow 图片开始的行
     * @param beginCol 图片开始的列
     * @param endRow 图片结束的行
     * @param endCol 图片结束的列
     */
    public void insertPicture(Sheet sheet, String imagePath,
                           int leftDX, int topDY, int widthDX ,int heightDY,
                           int beginRow, int beginCol, int endRow, int endCol) {
        Drawing drawing = sheet.createDrawingPatriarch();
        ClientAnchor clientAnchor = workbook.getCreationHelper().createClientAnchor();
        clientAnchor.setDx1(leftDX);
        clientAnchor.setDy1(topDY);
        clientAnchor.setDx2(widthDX);
        clientAnchor.setDy2(heightDY);
        clientAnchor.setRow1(beginRow);
        clientAnchor.setCol1(beginCol);
        clientAnchor.setRow2(endRow);
        clientAnchor.setCol2(endCol);
        Picture picture = drawing.createPicture(clientAnchor, workbook.addPicture(ImageUtils.getImageData(imagePath), getImageType(imagePath)));
        picture.resize();
    }

    /**
     * 在指定工作表的指定位置插入图片
     * @param sheet 工作表
     * @param imageInputStream 图片输入流
     * @param imageType 图片文件类型枚举，推荐使用png或jpg图片
     * @param leftDX 图片在单元格中离左上角的x距离
     * @param topDY 图片在单元格中离左上角的y距离
     * @param widthDX 图片的宽度
     * @param heightDY 图片的高度
     * @param beginRow 图片开始的行
     * @param beginCol 图片开始的列
     * @param endRow 图片结束的行
     * @param endCol 图片结束的列
     */
    public void insertPicture(Sheet sheet, InputStream imageInputStream, MIMETypeEnum imageType,
                              int leftDX, int topDY, int widthDX ,int heightDY,
                              int beginRow, int beginCol, int endRow, int endCol) {
        Drawing drawing = sheet.createDrawingPatriarch();
        ClientAnchor clientAnchor = workbook.getCreationHelper().createClientAnchor();
        clientAnchor.setDx1(leftDX);
        clientAnchor.setDy1(topDY);
        clientAnchor.setDx2(widthDX);
        clientAnchor.setDy2(heightDY);
        clientAnchor.setRow1(beginRow);
        clientAnchor.setCol1(beginCol);
        clientAnchor.setRow2(endRow);
        clientAnchor.setCol2(endCol);
        Picture picture = drawing.createPicture(clientAnchor, workbook.addPicture(ImageUtils.getImageData(imageInputStream, imageType), getImageType(imageType)));
        picture.resize();
    }

    /**
     * 根据图片路径获取到POI中对应的图片类型整型常量
     * @param imagePath
     * @return POI中图片类型对应的整型常量
     */
    private int getImageType(String imagePath) {
        return getImageType(ImageUtils.getImageType(imagePath));
    }

    /**
     * 根据图片类型枚举获取到POI中对应的图片类型整型常量
     * @param imageType
     * @return POI中图片类型对应的整型常量
     */
    private int getImageType(MIMETypeEnum imageType) {
        if (imageType == MIMETypeEnum.JPG) {
            return Workbook.PICTURE_TYPE_JPEG;
        } else if (imageType == MIMETypeEnum.PNG) {
            return Workbook.PICTURE_TYPE_PNG;
        }
        return -1;
    }

    /**
     * 关闭Workbook对象
     */
    public void close() {
        if (workbook != null) {
            try {
                workbook.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

}
