package com.sunshine_shop.dtos;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

import java.math.BigDecimal;
import java.util.Date;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ProductDTO {
    private Long id;
    private String name;
    private BigDecimal price;
    private int quantity;
    private MultipartFile image;
    private String imageUrl;
    private String description;
    private Long supplier_id;
    private Long category_id;
    private Date created_at;
    private Date updated_at;
}
