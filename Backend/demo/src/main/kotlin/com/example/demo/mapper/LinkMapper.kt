package com.example.demo.mapper

import com.example.demo.dto.LinkDto
import com.example.demo.entity.Link
import org.mapstruct.Mapper
import org.mapstruct.Mapping
import org.mapstruct.Mappings

@Mapper
interface LinkMapper {
    @Mappings(
        Mapping(source = "id", target = "id"),
        Mapping(source = "url", target = "url")
    )
    fun toDTO(link: Link): LinkDto

    @Mappings(
        Mapping(source = "id", target = "id"),
        Mapping(source = "url", target = "url")
    )
    fun toEntity(dto: LinkDto): Link
}
