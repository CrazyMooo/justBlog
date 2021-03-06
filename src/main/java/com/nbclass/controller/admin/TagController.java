package com.nbclass.controller.admin;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.nbclass.framework.annotation.AccessToken;
import com.nbclass.framework.util.ResponseUtil;
import com.nbclass.model.BlogTag;
import com.nbclass.service.TagService;
import com.nbclass.vo.ResponseVo;
import com.nbclass.vo.TagVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/admin/tag")
public class TagController {
    @Autowired
    private TagService tagService;

    @PostMapping("/list")
    @AccessToken
    public ResponseVo loadTags(TagVo vo){
        PageHelper.startPage(vo.getPageNum(), vo.getPageSize());
        List<BlogTag> tagList = tagService.selectList(vo.getName());
        PageInfo<BlogTag> pageInfo = new PageInfo<>(tagList);
        return ResponseUtil.success(pageInfo);
    }

    @PostMapping("/save")
    @AccessToken
    public ResponseVo add(BlogTag tag){
        return tagService.save(tag);
    }

    @PostMapping("/delete")
    @AccessToken
    public ResponseVo delete(@RequestParam("ids[]") Integer[]ids){
        tagService.deleteBatch(ids);
        return ResponseUtil.success("删除标签成功");
    }

}
