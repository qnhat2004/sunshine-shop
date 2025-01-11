package com.sunshine_shop.service;

import com.sunshine_shop.dtos.ProductDTO;
import com.sunshine_shop.entity.Category;
import com.sunshine_shop.entity.Product;
import com.sunshine_shop.entity.Supplier;
import com.sunshine_shop.repository.ProductRepository;
import com.sunshine_shop.service.interfaceService.IProductService;
import jakarta.transaction.Transactional;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
@AllArgsConstructor
public class ProductService implements IProductService {

    private final ProductRepository productRepository;
    private final FilesStorageService filesStorageService;
    private final SupplierService supplierService;
    private final CategoryService categoryService;

    @Override
    public List<Product> getAllProducts() {
        return productRepository.findAll();
    }

    @Override
    public Product getProductById(Long id) {
        Product product = productRepository.findById(id).orElse(null);
        return product;
    }

    @Override
    @Transactional
    public Product createProduct(ProductDTO productDTO) {   // save image to folder and save image name to database, create new product entity
        Supplier supplier = supplierService.getSupplierById(productDTO.getSupplier_id());
        Category category = categoryService.getCategoryById(productDTO.getCategory_id());
        String fileName = filesStorageService.save(productDTO.getImage());
        Product product = Product.builder()
                .name(productDTO.getName())
                .price(productDTO.getPrice())
                .quantity(productDTO.getQuantity())
                .image(fileName)
                .description(productDTO.getDescription())
                .supplier(supplier)
                .category(category)
                .created_at(productDTO.getCreated_at())
                .updated_at(productDTO.getUpdated_at())
                .build();
        Product savedProduct = productRepository.save(product);
        return savedProduct;
    }

    @Override
    @Transactional
    public Product updateProduct(Long id, ProductDTO productDTO) {
        Product existProduct = productRepository.findById(id).orElse(null);
        Supplier supplier = supplierService.getSupplierById(productDTO.getSupplier_id());
        Category category = categoryService.getCategoryById(productDTO.getCategory_id());
        existProduct.setName(productDTO.getName());
        existProduct.setPrice(productDTO.getPrice());
        existProduct.setQuantity(productDTO.getQuantity());
        existProduct.setDescription(productDTO.getDescription());
        existProduct.setSupplier(supplier);
        existProduct.setCategory(category);
        existProduct.setUpdated_at(productDTO.getUpdated_at());

        // Update image if new image is uploaded
        if (productDTO.getImage() != null) {
            String fileName = filesStorageService.save(productDTO.getImage());
            existProduct.setImage(fileName);
        }

        Product updatedProduct = productRepository.save(existProduct);
        return updatedProduct;
    }

    @Override
    @Transactional
    public void deleteProduct(Long id) {
        productRepository.deleteById(id);
    }
}
