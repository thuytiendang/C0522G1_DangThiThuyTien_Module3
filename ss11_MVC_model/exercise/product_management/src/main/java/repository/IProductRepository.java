package repository;

import model.Product;

import java.util.List;

public interface IProductRepository {
    List<Product> findAll();

    void save(Product product);

    void update(int id, Product product);

    void remove(int id);

    Product findByName(String name);

    Product findById(int id);
}
