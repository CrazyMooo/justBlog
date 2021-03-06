package com.nbclass.mapper;

import com.nbclass.framework.util.MyMapper;
import com.nbclass.model.BlogArticle;
import com.nbclass.model.BlogCategory;
import com.nbclass.vo.ArticleVo;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * UserMapper
 *
 * @version V1.0
 * @date 2019/10/10
 * @author nbclass
 */
@Repository
public interface ArticleMapper extends MyMapper<BlogArticle> {
    /**
     * 根据参数查询文章集合
     * @param articleVo 查询
     * @return list
     */
    List<BlogArticle> selectList(ArticleVo articleVo);

    /**
     * 查询指定文章的标签集合
     *
     * @param articleIds 文章ids
     * @return list
     */
    List<BlogArticle> selectTagsByArticleId(List<Integer> articleIds);


    /**
     * 根据articleIds查询评论数量
     * @return int
     */
    List<BlogArticle> selectCommentNumsBySids(List<Integer> articleIds);

    /**
     * 网站信息统计
     * @return map
     */
    Map<String, Object> siteInfoStatistics();

    /**
     * 根据文章别名查询文章
     * @return article
     */
    BlogArticle selectByAliasName(String alias);

    /**
     * 根据文章id查询文章
     * @return article
     */
    BlogArticle selectById(Integer id);

    /**
     * 更新文章相关数量
     * @return int
     */
    int updateNum(Map<String,Object> map);

    /**
     * 根据ids删除文章
     * @param ids id集合
     * @return int
     */
    int deleteBatch(Integer[] ids);

    /**
     * 根据分类id查询文章id集合
     * @param categoryId 分类id
     * @return int
     */
    List<Integer> selectArticleIdsByCategoryId(Integer categoryId);
}
