package ${basePackage}.web;
import ${basePackage}.core.ApiResponse;
import ${basePackage}.model.${modelNameUpperCamel};
import ${basePackage}.service.${modelNameUpperCamel}Service;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

/**
* Created by ${author} on ${date}.
*/
@RestController
@RequestMapping("${baseRequestMapping}")
public class ${modelNameUpperCamel}Controller {
    @Resource
    private ${modelNameUpperCamel}Service ${modelNameLowerCamel}Service;

    @PostMapping("/add")
    public ApiResponse add(${modelNameUpperCamel} ${modelNameLowerCamel}) {
        ${modelNameLowerCamel}Service.save(${modelNameLowerCamel});
        return ApiResponse.getSuccResponse("");
    }

    @PostMapping("/delete")
    public ApiResponse delete(@RequestParam Integer id) {
        ${modelNameLowerCamel}Service.deleteById(id);
        return ApiResponse.getSuccResponse("");
    }

    @PostMapping("/update")
    public ApiResponse update(${modelNameUpperCamel} ${modelNameLowerCamel}) {
        ${modelNameLowerCamel}Service.update(${modelNameLowerCamel});
        return ApiResponse.getSuccResponse("");
    }

    @PostMapping("/detail")
    public ApiResponse detail(@RequestParam Integer id) {
        ${modelNameUpperCamel} ${modelNameLowerCamel} = ${modelNameLowerCamel}Service.findById(id);
        return ApiResponse.getSuccResponse(${modelNameLowerCamel});
    }

    @PostMapping("/list")
    public ApiResponse list(@RequestParam(defaultValue = "0") Integer page, @RequestParam(defaultValue = "0") Integer size) {
        PageHelper.startPage(page, size);
        List<${modelNameUpperCamel}> list = ${modelNameLowerCamel}Service.findAll();
        PageInfo pageInfo = new PageInfo(list);
        return ApiResponse.getSuccResponse(pageInfo);
    }
}
