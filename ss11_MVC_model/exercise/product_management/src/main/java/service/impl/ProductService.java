package service.impl;

import model.Product;
import repository.IProductRepository;
import repository.ProductRepository;
import service.IProductService;

import java.util.List;

public class ProductService implements IProductService {
    private IProductRepository iProductRepository = new ProductRepository();

    @Override
    public List<Product> findAll() {
        return iProductRepository.findAll();
    }

    @Override
    public void save(Product product) {
        iProductRepository.save(product);
    }

    @Override
    public void update(int id, Product product) {
        iProductRepository.update(id, product);
    }

    @Override
    public void remove(int id) {
        iProductRepository.remove(id);
    }

    @Override
    public Product findByName(String name) {
        return iProductRepository.findByName(name);
    }

    @Override
    public Product findById(int id) {
        return iProductRepository.findById(id);
    }
}
