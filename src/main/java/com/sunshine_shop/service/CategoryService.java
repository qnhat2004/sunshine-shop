package com.sunshine_shop.service;

import com.sunshine_shop.entity.Category;
import com.sunshine_shop.repository.CategoryRepository;
import com.sunshine_shop.service.interfaceService.ICategoryService;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
@RequiredArgsConstructor
public class CategoryService implements ICategoryService {
    private final CategoryRepository categoryRepository;

    @Override
    public List<Category> getAllCategories() {
        return categoryRepository.findAll();
    }

    @Override
    public Category getCategoryById(Long id) {
        return categoryRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Category not found"));
    }

    @Override
    @Transactional
    public Category createCategory(Category category) {
        Category newCategory = Category.builder()
                .name(category.getName())
                .description(category.getDescription())
                .build();
        return categoryRepository.save(newCategory);
    }

    @Override
    @Transactional
    public Category updateCategory(Long id, Category category) {
        Category cur = getCategoryById(id);
        cur.setName(category.getName());
        cur.setDescription(category.getDescription());
        cur.setUpdated_at(new Date());
        return categoryRepository.save(cur);
    }

    @Override
    public void deleteCategory(Long id) {
        categoryRepository.deleteById(id);
    }

    public static class FileStorageService {
    }
}
