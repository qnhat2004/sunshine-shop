package com.sunshine_shop.service;

import com.sunshine_shop.entity.Product;
import com.sunshine_shop.repository.ProductRepository;
import com.sunshine_shop.service.interfaceService.IProductService;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class ProductService implements IProductService {
    @Autowired
    private ProductRepository productRepository;

    @Override
    public List<Product> getAllProducts() {
        return productRepository.findAll();
    }

    @Override
    public Product getProductById(Long id) {
        return productRepository.findById(id).orElse(null);
    }

    @Override
    public Product createProduct(Product product) {
        return productRepository.save(product);
    }

    @Override
    public Product updateProduct(Long id, Product product) {
        Product existProduct = productRepository.findById(id).orElse(null);
        existProduct.builder()
                .name(product.getName())
                .price(product.getPrice())
                .quantity(product.getQuantity())
                .image(product.getImage())
                .description(product.getDescription())
                .supplier(product.getSupplier())
                .category(product.getCategory())
                .created_at(product.getCreated_at())
                .updated_at(product.getUpdated_at())
                .build();
        return productRepository.save(existProduct);
    }

    @Override
    public void deleteProduct(Long id) {
        productRepository.deleteById(id);
    }
}
