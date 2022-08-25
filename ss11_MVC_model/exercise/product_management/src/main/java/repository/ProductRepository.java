package repository;

import model.Product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductRepository implements IProductRepository {
    private static Map<Integer, Product> productMap;

    static {
        productMap = new HashMap<>();
        productMap.put(1, new Product(1, "Trà Atiso", 200000, "món quà từ thiên nhiên", "Đà Lạt"));
        productMap.put(2, new Product(2, "Giày MBL", 1900000, "Đẹp và thời thượng", "MBL"));
        productMap.put(3, new Product(3, "Mèo bông hoàng thượng", 400000, "cho giấc ngủ êm ái", "Quảng Châu"));
        productMap.put(4, new Product(4, "Tinh dầu hoa nhài", 100000, "buổ tối thư giãn", "Bali"));
        productMap.put(5, new Product(5, "ví da", 200000, "Ví da cá sấu", "juno"));
    }


    @Override
    public List<Product> findAll() {
        return new ArrayList<>(productMap.values());
    }

    @Override
    public void save(Product product) {
        productMap.put(product.getId(), product);
    }

    @Override
    public void update(int id, Product product) {
        productMap.put(id, product);
    }

    @Override
    public void remove(int id) {
        productMap.remove(id);
    }

    @Override
    public Product findByName(String name) {
        return null;
    }

    @Override
    public Product findById(int id) {
        return productMap.get(id);
    }
}
