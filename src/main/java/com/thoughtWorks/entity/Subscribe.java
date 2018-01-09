package com.thoughtWorks.entity;

public class Subscribe {
    private Integer sId;
    private Integer customId;
    private Integer modelId;
    /**
     *    判断字段是否是收藏字段：1表示为收藏，2表示已经收藏
     */
    private Integer sWhether;

    public Integer getsWhether() {
        return sWhether;
    }

    public void setsWhether(Integer sWhether) {
        this.sWhether = sWhether;
    }

    public Integer getsId() {
        return sId;
    }

    public void setsId(Integer sId) {
        this.sId = sId;
    }

    public Integer getCustomId() {
        return customId;
    }

    public void setCustomId(Integer customId) {
        this.customId = customId;
    }

    public Integer getModelId() {
        return modelId;
    }

    public void setModelId(Integer modelId) {
        this.modelId = modelId;
    }
}
