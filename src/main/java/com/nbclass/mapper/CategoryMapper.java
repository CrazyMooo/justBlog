package com.nbclass.mapper;

import com.nbclass.framework.util.MyMapper;
import com.nbclass.model.BlogCategory;
import com.nbclass.model.BlogUser;
import com.nbclass.vo.CategoryVo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * UserMapper
 *
 * @version V1.0
 * @date 2019/10/10
 * @author nbclass
 */
@Repository
public interface CategoryMapper extends MyMapper<BlogCategory> {
    /**
     * 根据参数查询栏目列表
     * @param type 类型
     * @return list
     */
    List<BlogCategory> selectList(@Param("type") Integer type);


    /**
     * 删除
     * @param id id
     */
    int deleteById(Integer id);
}
