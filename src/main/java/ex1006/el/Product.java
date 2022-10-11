package ex1006.el;

public class Product {
    private String code = "A01";
    private String name = "새우깡";
    private int price = 3500;
    private int qty = 5;

    public Product() {
        System.out.println("Product 생성자...");
    }

    public String getCode() {
        System.out.println("getCode() call...");
        return code;
    }

    public String getName() {
        System.out.println("getName() call...");
        return name;
    }

    public int getPrice() {
        System.out.println("getPrice() call...");
        return price;
    }

    public int getQty() {
        System.out.println("getQty() call...");
        return qty;
    }


}
