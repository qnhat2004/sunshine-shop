package com.sunshine_shop.service.interfaceService;

import com.sunshine_shop.dtos.ProductDTO;
import com.sunshine_shop.entity.Product;

import java.util.List;

public interface IProductService {
    List<Product> getAllProducts();
    Product getProductById(Long id);
    Product createProduct(ProductDTO productDTO);
    Product updateProduct(Long id, ProductDTO productDTO);
    void deleteProduct(Long id);
}
