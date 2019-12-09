package com.nbclass.service.impl;

import com.nbclass.mapper.CategoryMapper;
import com.nbclass.model.BlogCategory;
import com.nbclass.service.CategoryService;
import com.nbclass.vo.CategoryVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * CategoryServiceImpl
 *
 * @author nbclass
 * @version V1.0
 * @date 2019-10-18
 */
@Service
public class CategoryServiceImpl implements CategoryService {

    @Autowired
    private CategoryMapper categoryMapper;

    @Override
    public List<BlogCategory> selectAll(Integer type) {
        return categoryMapper.selectList(type);
    }

    @Override
    public BlogCategory selectByAlias(String alias) {
        BlogCategory category = new BlogCategory();
        category.setAliasName(alias);
        return categoryMapper.selectOne(category);
    }

    @Override
    public void save(BlogCategory category) {
        Date date = new Date();
        category.setUpdateTime(date);
        if(category.getId()==null){
            category.setCreateTime(date);
            categoryMapper.insertSelective(category);
        }else{
            categoryMapper.updateByPrimaryKeySelective(category);
        }
    }

    @Override
    public void deleteById(Integer id) {
        categoryMapper.deleteById(id);
    }
}
